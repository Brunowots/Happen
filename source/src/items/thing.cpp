/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#include "pch.hpp"

#include "items/thing.h"
#include "items/tile.h"

const Position &Thing::getPosition() const {
	const Tile* tile = getTile();
	if (!tile) {
		return Tile::nullptr_tile.getPosition();
	}
	return tile->getPosition();
}

Tile* Thing::getTile() {
	return dynamic_cast<Tile*>(this);
}

const Tile* Thing::getTile() const {
	return dynamic_cast<const Tile*>(this);
}
