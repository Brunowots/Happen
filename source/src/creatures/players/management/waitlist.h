/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_CREATURES_PLAYERS_MANAGEMENT_WAITLIST_H_
#define SRC_CREATURES_PLAYERS_MANAGEMENT_WAITLIST_H_

struct WaitListInfo;

class WaitingList {
	public:
		static WaitingList &getInstance();

		bool clientLogin(const Player* player);
		std::size_t getClientSlot(const Player* player);
		static std::size_t getTime(std::size_t slot);

	private:
		WaitingList();

		std::unique_ptr<WaitListInfo> info;
};

#endif // SRC_CREATURES_PLAYERS_MANAGEMENT_WAITLIST_H_
