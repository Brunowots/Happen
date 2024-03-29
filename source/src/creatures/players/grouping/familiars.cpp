/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#include "pch.hpp"

#include "creatures/players/grouping/familiars.h"
#include "config/configmanager.h"
#include "utils/pugicast.h"
#include "utils/tools.h"

bool Familiars::loadFromXml() {
	pugi::xml_document doc;
	auto folder = g_configManager().getString(CORE_DIRECTORY) + "/XML/familiars.xml";
	pugi::xml_parse_result result = doc.load_file(folder.c_str());
	if (!result) {
		SPDLOG_ERROR("Failed to load Familiars");
		printXMLError(__FUNCTION__, folder, result);
		return false;
	}

	for (auto familiarsNode : doc.child("familiars").children()) {
		pugi::xml_attribute attr;
		if ((attr = familiarsNode.attribute("enabled")) && !attr.as_bool()) {
			continue;
		}

		if (!(attr = familiarsNode.attribute("vocation"))) {
			SPDLOG_WARN("[Familiars::loadFromXml] - Missing familiar vocation.");
			continue;
		}

		uint16_t vocation = pugi::cast<uint16_t>(attr.value());
		if (vocation > VOCATION_LAST) {
			SPDLOG_WARN("[Familiars::loadFromXml] - Invalid familiar vocation {}", vocation);
			continue;
		}

		pugi::xml_attribute lookTypeAttribute = familiarsNode.attribute("lookType");
		if (!lookTypeAttribute) {
			SPDLOG_WARN("[Familiars::loadFromXml] - Missing looktype on familiar.");
			continue;
		}

		familiars[vocation].emplace_back(
			familiarsNode.attribute("name").as_string(),
			pugi::cast<uint16_t>(lookTypeAttribute.value()),
			familiarsNode.attribute("premium").as_bool(),
			familiarsNode.attribute("unlocked").as_bool(true),
			familiarsNode.attribute("type").as_string()
		);
	}
	for (uint16_t vocation = VOCATION_NONE; vocation <= VOCATION_LAST; ++vocation) {
		familiars[vocation].shrink_to_fit();
	}
	return true;
}

const Familiar* Familiars::getFamiliarByLookType(uint16_t vocation, uint16_t lookType) const {
	for (const Familiar &familiar : familiars[vocation]) {
		if (familiar.lookType == lookType) {
			return &familiar;
		}
	}
	return nullptr;
}
