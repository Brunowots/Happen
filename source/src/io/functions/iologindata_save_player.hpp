/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_IO__FUNCTIONS_IOLOGINDATASAVE_HPP_
#define SRC_IO__FUNCTIONS_IOLOGINDATASAVE_HPP_

#include "io/iologindata.h"

class IOLoginDataSave : public IOLoginData {
	public:
		static bool savePlayerForgeHistory(Player* player);
		static bool saveRewardItems(Player* player);
		static bool savePlayerBosstiary(const Player* player);
};

#endif // SRC_IO__FUNCTIONS_IOLOGINDATASAVE_HPP_
