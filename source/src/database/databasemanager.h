/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_DATABASE_DATABASEMANAGER_H_
#define SRC_DATABASE_DATABASEMANAGER_H_

#include "database/database.h"

class DatabaseManager {
	public:
		static bool tableExists(const std::string &table);

		static int32_t getDatabaseVersion();
		static bool isDatabaseSetup();

		static bool optimizeTables();
		static void updateDatabase();

		static bool getDatabaseConfig(const std::string &config, int32_t &value);
		static void registerDatabaseConfig(const std::string &config, int32_t value);
};
#endif // SRC_DATABASE_DATABASEMANAGER_H_
