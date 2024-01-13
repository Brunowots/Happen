/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_SERVER_NETWORK_WEBHOOK_WEBHOOK_H_
#define SRC_SERVER_NETWORK_WEBHOOK_WEBHOOK_H_

void webhook_init();

void webhook_send_message(std::string title, std::string message, int color, std::string url);

#endif // SRC_SERVER_NETWORK_WEBHOOK_WEBHOOK_H_
