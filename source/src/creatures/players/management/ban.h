/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_CREATURES_PLAYERS_MANAGEMENT_BAN_H_
#define SRC_CREATURES_PLAYERS_MANAGEMENT_BAN_H_

struct BanInfo {
		std::string bannedBy;
		std::string reason;
		time_t expiresAt;
};

struct ConnectBlock {
		constexpr ConnectBlock(uint64_t lastAttempt, uint64_t blockTime, uint32_t count) :
			lastAttempt(lastAttempt), blockTime(blockTime), count(count) { }

		uint64_t lastAttempt;
		uint64_t blockTime;
		uint32_t count;
};

using IpConnectMap = std::map<uint32_t, ConnectBlock>;

class Ban {
	public:
		bool acceptConnection(uint32_t clientIP);

	private:
		IpConnectMap ipConnectMap;
		std::recursive_mutex lock;
};

class IOBan {
	public:
		static bool isAccountBanned(uint32_t accountId, BanInfo &banInfo);
		static bool isIpBanned(uint32_t clientIP, BanInfo &banInfo);
		static bool isPlayerNamelocked(uint32_t playerId);
};

#endif // SRC_CREATURES_PLAYERS_MANAGEMENT_BAN_H_
