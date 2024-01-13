/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_SERVER_SIGNALS_H_
#define SRC_SERVER_SIGNALS_H_

class Signals {
		asio::signal_set set;

	public:
		explicit Signals(asio::io_service &service);

	private:
		void asyncWait();
		static void dispatchSignalHandler(int signal);

		static void sigbreakHandler();
		static void sigintHandler();
		static void sighupHandler();
		static void sigtermHandler();
		static void sigusr1Handler();
};

#endif // SRC_SERVER_SIGNALS_H_
