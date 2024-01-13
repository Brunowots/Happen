/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_IO_FUNCTIONS_IOLOGINDATALOAD_HPP_
#define SRC_IO_FUNCTIONS_IOLOGINDATALOAD_HPP_

#include "io/iologindata.h"

class IOLoginDataLoad : public IOLoginData {
	public:
		static void loadPlayerForgeHistory(Player* player, DBResult_ptr result);
		static void loadRewardItems(Player* player);
		static void loadPlayerBosstiary(Player* player, DBResult_ptr result);

	private:
		static void bindRewardBag(Player* player, ItemMap &itemMap);
		static void insertItemsIntoRewardBag(const ItemMap &itemMap);
};

#endif // SRC_IO_FUNCTIONS_IOLOGINDATALOAD_HPP_
