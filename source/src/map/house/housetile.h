/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_MAP_HOUSE_HOUSETILE_H_
#define SRC_MAP_HOUSE_HOUSETILE_H_

#include "items/tile.h"

class House;

class HouseTile final : public DynamicTile {
	public:
		HouseTile(int32_t x, int32_t y, int32_t z, House* house);

		// cylinder implementations
		ReturnValue queryAdd(int32_t index, const Thing &thing, uint32_t count, uint32_t flags, Creature* actor = nullptr) const override;

		Tile* queryDestination(int32_t &index, const Thing &thing, Item** destItem, uint32_t &flags) override;

		ReturnValue queryRemove(const Thing &thing, uint32_t count, uint32_t flags, Creature* actor = nullptr) const override;

		void addThing(int32_t index, Thing* thing) override;
		void virtual internalAddThing(uint32_t index, Thing* thing) override;

		House* getHouse() {
			return house;
		}

	private:
		void updateHouse(Item* item);

		House* house;
};

#endif // SRC_MAP_HOUSE_HOUSETILE_H_
