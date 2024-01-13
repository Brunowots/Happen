/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_IO_IOMAPSERIALIZE_H_
#define SRC_IO_IOMAPSERIALIZE_H_

#include "map/map.h"

class IOMapSerialize {
	public:
		static void loadHouseItems(Map* map);
		static bool saveHouseItems();
		static bool loadHouseInfo();
		static bool saveHouseInfo();

	private:
		static void saveItem(PropWriteStream &stream, const Item* item);
		static void saveTile(PropWriteStream &stream, const Tile* tile);

		static bool loadContainer(PropStream &propStream, Container* container);
		static bool loadItem(PropStream &propStream, Cylinder* parent);
};

#endif // SRC_IO_IOMAPSERIALIZE_H_
