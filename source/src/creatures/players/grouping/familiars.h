/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_CREATURES_PLAYERS_GROUPING_FAMILIARS_H_
#define SRC_CREATURES_PLAYERS_GROUPING_FAMILIARS_H_

#include "declarations.hpp"

class Familiars {
	public:
		static Familiars &getInstance() {
			static Familiars instance;
			return instance;
		}
		bool loadFromXml();
		const std::vector<Familiar> &getFamiliars(uint16_t vocation) const {
			return familiars[vocation];
		}
		const Familiar* getFamiliarByLookType(uint16_t vocation, uint16_t lookType) const;

	private:
		std::vector<Familiar> familiars[VOCATION_LAST + 1];
};

#endif // SRC_CREATURES_PLAYERS_GROUPING_FAMILIARS_H_
