/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_CREATURES_PLAYERS_GROUPING_GUILD_H_
#define SRC_CREATURES_PLAYERS_GROUPING_GUILD_H_

class Player;

struct GuildRank {
		uint32_t id;
		std::string name;
		uint8_t level;

		GuildRank(uint32_t initId, std::string initName, uint8_t initLevel) :
			id(initId), name(std::move(initName)), level(initLevel) { }
};

using GuildRank_ptr = std::shared_ptr<GuildRank>;
class Guild {
	public:
		Guild(uint32_t initId, std::string initName) :
			name(std::move(initName)), id(initId) { }

		void addMember(Player* player);
		void removeMember(Player* player);

		uint32_t getId() const {
			return id;
		}
		const std::string &getName() const {
			return name;
		}
		const std::list<Player*> &getMembersOnline() const {
			return membersOnline;
		}
		uint32_t getMemberCount() const {
			return memberCount;
		}
		uint32_t getLevel() const {
			return level;
		}
		uint32_t getPoints() const {
			return points;
		}
		
		void setPoints(uint32_t _points);
		void setLevel(uint32_t _level);
		void setMemberCount(uint32_t count) {
			memberCount = count;
		}
		uint64_t getBankBalance() const {
			return bankBalance;
		}
		void setBankBalance(uint64_t balance) {
			bankBalance = balance;
		}

		const std::vector<GuildRank_ptr> &getRanks() const {
			return ranks;
		}

		GuildRank_ptr getRankById(uint32_t id);
		GuildRank_ptr getRankByName(const std::string &name) const;
		GuildRank_ptr getRankByLevel(uint8_t level) const;
		void addRank(uint32_t id, const std::string &name, uint8_t level);

		const std::string &getMotd() const {
			return motd;
		}
		void setMotd(const std::string &newMotd) {
			this->motd = newMotd;
		}

	private:
		std::list<Player*> membersOnline;
		uint32_t points = 0;
        uint32_t level = 1;
		std::vector<GuildRank_ptr> ranks;
		std::string name;
		uint64_t bankBalance = 0;
		std::string motd;
		uint32_t id;
		uint32_t memberCount = 0;
};

#endif // SRC_CREATURES_PLAYERS_GROUPING_GUILD_H_
