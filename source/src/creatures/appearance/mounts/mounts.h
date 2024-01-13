/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_CREATURES_APPEARANCE_MOUNTS_MOUNTS_H_
#define SRC_CREATURES_APPEARANCE_MOUNTS_MOUNTS_H_

struct Mount {
		Mount(uint8_t initId, uint16_t initClientId, std::string initName, int32_t initSpeed, bool initPremium, std::string initType) :
			name(initName), speed(initSpeed), clientId(initClientId), id(initId), premium(initPremium),
			type(initType) { }

		std::string name;
		int32_t speed;
		uint16_t clientId;
		uint8_t id;
		bool premium;
		std::string type;
};

class Mounts {
	public:
		bool reload();
		bool loadFromXml();
		Mount* getMountByID(uint8_t id);
		Mount* getMountByName(const std::string &name);
		Mount* getMountByClientID(uint16_t clientId);

		const std::vector<Mount> &getMounts() const {
			return mounts;
		}

	private:
		std::vector<Mount> mounts;
};

#endif // SRC_CREATURES_APPEARANCE_MOUNTS_MOUNTS_H_
