/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_ITEMS_BED_H_
#define SRC_ITEMS_BED_H_

#include "items/item.h"

class House;
class Player;

class BedItem final : public Item {
	public:
		explicit BedItem(uint16_t id);

		BedItem* getBed() override {
			return this;
		}
		const BedItem* getBed() const override {
			return this;
		}

		Attr_ReadValue readAttr(AttrTypes_t attr, PropStream &propStream) override;
		void serializeAttr(PropWriteStream &propWriteStream) const override;

		bool canRemove() const override {
			return house == nullptr;
		}

		uint32_t getSleeper() const {
			return sleeperGUID;
		}

		void setHouse(House* h) {
			house = h;
		}

		bool canUse(Player* player);

		bool trySleep(Player* player);
		bool sleep(Player* player);
		void wakeUp(Player* player);

		BedItem* getNextBedItem() const;

	private:
		void updateAppearance(const Player* player);
		void regeneratePlayer(Player* player) const;
		void internalSetSleeper(const Player* player);
		void internalRemoveSleeper();

		House* house = nullptr;
		uint64_t sleepStart;
		uint32_t sleeperGUID;
};

#endif // SRC_ITEMS_BED_H_
