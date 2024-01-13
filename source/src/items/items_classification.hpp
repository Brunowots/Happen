/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_ITEMS_ITEMS_CLASSIFICATION_HPP_
#define SRC_ITEMS_ITEMS_CLASSIFICATION_HPP_

struct TierInfo {
		uint64_t priceToUpgrade = 0;
		uint8_t corePriceToFuse = 0;
};

// Classification class for forging system and market.
class ItemClassification {
	public:
		ItemClassification() = default;
		explicit ItemClassification(uint8_t id) :
			id(id) { }
		virtual ~ItemClassification() = default;

		void addTier(uint8_t tierId, uint64_t tierPrice, uint8_t corePrice) {
			auto &table = tiers[tierId];
			table.priceToUpgrade = tierPrice;
			table.corePriceToFuse = corePrice;
		}

		uint8_t id;
		std::map<uint8_t, TierInfo> tiers;
};

#endif // SRC_ITEMS_ITEMS_CLASSIFICATION_HPP_
