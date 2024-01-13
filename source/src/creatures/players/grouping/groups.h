/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_CREATURES_PLAYERS_GROUPING_GROUPS_H_
#define SRC_CREATURES_PLAYERS_GROUPING_GROUPS_H_

#include "declarations.hpp"

struct Group {
		std::string name;
		std::array<bool, magic_enum::enum_integer(PlayerFlags_t::FlagLast)> flags { false };
		uint32_t maxDepotItems;
		uint32_t maxVipEntries;
		uint16_t id;
		bool access;
};

class Groups {
	public:
		static uint8_t getFlagNumber(PlayerFlags_t playerFlags);
		static PlayerFlags_t getFlagFromNumber(uint8_t value);
		bool reload() const;
		bool load();
		Group* getGroup(uint16_t id);
		std::vector<Group> &getGroups() {
			return groups_vector;
		}

	private:
		std::vector<Group> groups_vector;
};

#endif // SRC_CREATURES_PLAYERS_GROUPING_GROUPS_H_
