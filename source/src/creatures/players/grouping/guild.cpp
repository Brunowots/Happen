/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#include "pch.hpp"

#include "creatures/players/grouping/guild.h"
#include "game/game.h"

void Guild::addMember(Player* player) {
	membersOnline.push_back(player);
	for (Player* member : membersOnline) {
		g_game().updatePlayerHelpers(member);
	}
}

void Guild::removeMember(Player* player) {
	membersOnline.remove(player);
	for (Player* member : membersOnline) {
		g_game().updatePlayerHelpers(member);
	}

	g_game().updatePlayerHelpers(player);
	if (membersOnline.empty()) {
		g_game().removeGuild(id);
		delete this;
	}
}

GuildRank_ptr Guild::getRankById(uint32_t rankId) {
	for (auto rank : ranks) {
		if (rank->id == rankId) {
			return rank;
		}
	}
	return nullptr;
}

GuildRank_ptr Guild::getRankByName(const std::string &guildName) const {
	for (auto rank : ranks) {
		if (rank->name == guildName) {
			return rank;
		}
	}
	return nullptr;
}

GuildRank_ptr Guild::getRankByLevel(uint8_t level) const {
	for (auto rank : ranks) {
		if (rank->level == level) {
			return rank;
		}
	}
	return nullptr;
}

void Guild::addRank(uint32_t rankId, const std::string &rankName, uint8_t level) {
	ranks.emplace_back(std::make_shared<GuildRank>(rankId, rankName, level));
}

void Guild::setPoints(uint32_t _points) {
	points = _points;
	IOGuild::setPoints(id, points);
}

void Guild::setLevel(uint32_t _level) {
	level = _level;
	IOGuild::setLevel(id, level);
}