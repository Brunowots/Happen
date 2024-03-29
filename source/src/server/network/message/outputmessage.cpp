/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#include "pch.hpp"

#include "outputmessage.h"
#include "server/network/protocol/protocol.h"
#include "game/scheduling/scheduler.h"

const std::chrono::milliseconds OUTPUTMESSAGE_AUTOSEND_DELAY { 10 };

void OutputMessagePool::scheduleSendAll() {
	auto function = std::bind_front(&OutputMessagePool::sendAll, this);
	g_scheduler().addEvent(createSchedulerTask(OUTPUTMESSAGE_AUTOSEND_DELAY.count(), function));
}

void OutputMessagePool::sendAll() {
	// dispatcher thread
	for (auto &protocol : bufferedProtocols) {
		auto &msg = protocol->getCurrentBuffer();
		if (msg) {
			protocol->send(std::move(msg));
		}
	}

	if (!bufferedProtocols.empty()) {
		scheduleSendAll();
	}
}

void OutputMessagePool::addProtocolToAutosend(Protocol_ptr protocol) {
	// dispatcher thread
	if (bufferedProtocols.empty()) {
		scheduleSendAll();
	}
	bufferedProtocols.emplace_back(protocol);
}

void OutputMessagePool::removeProtocolFromAutosend(const Protocol_ptr &protocol) {
	// dispatcher thread
	auto it = std::ranges::find(bufferedProtocols.begin(), bufferedProtocols.end(), protocol);
	if (it != bufferedProtocols.end()) {
		*it = bufferedProtocols.back();
		bufferedProtocols.pop_back();
	}
}

OutputMessage_ptr OutputMessagePool::getOutputMessage() {
	return std::make_shared<OutputMessage>();
}
