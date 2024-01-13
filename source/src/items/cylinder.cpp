/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#include "pch.hpp"

#include "items/cylinder.h"

VirtualCylinder* VirtualCylinder::virtualCylinder = new VirtualCylinder;

int32_t Cylinder::getThingIndex(const Thing*) const {
	return -1;
}

size_t Cylinder::getFirstIndex() const {
	return 0;
}

size_t Cylinder::getLastIndex() const {
	return 0;
}

uint32_t Cylinder::getItemTypeCount(uint16_t, int32_t) const {
	return 0;
}

std::map<uint32_t, uint32_t> &Cylinder::getAllItemTypeCount(std::map<uint32_t, uint32_t> &countMap) const {
	return countMap;
}

Thing* Cylinder::getThing(size_t) const {
	return nullptr;
}

void Cylinder::internalAddThing(Thing*) {
	//
}

void Cylinder::internalAddThing(uint32_t, Thing*) {
	//
}

void Cylinder::startDecaying() {
	//
}
