/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_IO_IOGUILD_H_
#define SRC_IO_IOGUILD_H_

class Guild;
using GuildWarVector = std::vector<uint32_t>;

class IOGuild {
	public:
		static Guild* loadGuild(uint32_t guildId);
		static void saveGuild(Guild* guild);
		static uint32_t getGuildIdByName(const std::string &name);
		static void getWarList(uint32_t guildId, GuildWarVector &guildWarVector);
		static void setPoints(uint32_t guildId, uint32_t newPoints);
        static void setLevel(uint32_t guildId, uint32_t newlevel);
};

#endif // SRC_IO_IOGUILD_H_
