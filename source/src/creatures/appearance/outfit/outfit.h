/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_CREATURES_APPEARANCE_OUTFIT_OUTFIT_H_
#define SRC_CREATURES_APPEARANCE_OUTFIT_OUTFIT_H_

#include "declarations.hpp"

struct Outfit {
		Outfit(std::string initName, uint16_t initLookType, bool initPremium, bool initUnlocked, std::string initFrom) :
			name(initName), lookType(initLookType), premium(initPremium), unlocked(initUnlocked), from(initFrom) { }

		std::string name;
		uint16_t lookType;
		bool premium;
		bool unlocked;
		std::string from;
};

struct ProtocolOutfit {
		ProtocolOutfit(const std::string &initName, uint16_t initLookType, uint8_t initAddons) :
			name(initName), lookType(initLookType), addons(initAddons) { }

		const std::string &name;
		uint16_t lookType;
		uint8_t addons;
};

class Outfits {
	public:
		static Outfits &getInstance() {
			static Outfits instance;
			return instance;
		}

		const Outfit* getOpositeSexOutfitByLookType(PlayerSex_t sex, uint16_t lookType);

		bool loadFromXml();

		const Outfit* getOutfitByLookType(PlayerSex_t sex, uint16_t lookType) const;
		const std::vector<Outfit> &getOutfits(PlayerSex_t sex) const {
			return outfits[sex];
		}

	private:
		std::vector<Outfit> outfits[PLAYERSEX_LAST + 1];
};

#endif // SRC_CREATURES_APPEARANCE_OUTFIT_OUTFIT_H_
