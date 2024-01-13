/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#include "pch.hpp"

#include "game/movement/position.h"
#include "utils/tools.h"

Direction Position::getRandomDirection() {
	static std::vector<Direction> dirList {
		DIRECTION_NORTH,
		DIRECTION_WEST,
		DIRECTION_EAST,
		DIRECTION_SOUTH
	};
	std::shuffle(dirList.begin(), dirList.end(), getRandomGenerator());

	return dirList.front();
}

std::ostream &operator<<(std::ostream &os, const Position &pos) {
	os << pos.toString();
	return os;
}

std::ostream &operator<<(std::ostream &os, const Direction &dir) {
	switch (dir) {
		case DIRECTION_NORTH:
			os << "North";
			break;

		case DIRECTION_EAST:
			os << "East";
			break;

		case DIRECTION_WEST:
			os << "West";
			break;

		case DIRECTION_SOUTH:
			os << "South";
			break;

		case DIRECTION_SOUTHWEST:
			os << "South-West";
			break;

		case DIRECTION_SOUTHEAST:
			os << "South-East";
			break;

		case DIRECTION_NORTHWEST:
			os << "North-West";
			break;

		case DIRECTION_NORTHEAST:
			os << "North-East";
			break;

		default:
			break;
	}

	return os;
}
