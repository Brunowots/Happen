/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.17 and 13.20
 */

#ifndef SRC_CORE_HPP_
#define SRC_CORE_HPP_

static constexpr auto STATUS_SERVER_NAME = "HappenOT Custom";
static constexpr auto STATUS_SERVER_VERSION = "6.7.0";
static constexpr auto STATUS_SERVER_DEVELOPERS = "Oliveira Private Server 13.20 and Protocol OTC";

static constexpr auto AUTHENTICATOR_DIGITS = 6U;
static constexpr auto AUTHENTICATOR_PERIOD = 30U;

static constexpr auto CLIENT_VERSION = 1320;

#define CLIENT_VERSION_UPPER (CLIENT_VERSION / 100)
#define CLIENT_VERSION_LOWER (CLIENT_VERSION % 100)

#endif // SRC_CORE_HPP_
