=begin
    Logging module
    Statement
    Create a module to introduce logging features to any Ruby application. This module contains two methods:
    log(message): Logs the message to the standard output with INFO level.
    log(message, level): Logs the message to the standard output with the specific level. Available levels are: DEBUG, INFO, WARN, ERROR, FATAL. If the specific level is not part of the list of available level, then the method should throw an error message.
    Then, modify the Book Store exercise from the previous level and add logging to the method that calculates discounts and all the constructors.
    Topics to Practice: 
    OOP, modules, error handling.
=end

require 'logger'

module Logging
    AVAILABLE_LEVELS = [:debug, :info, :warn, :error, :fatal]

    def log(*args)
        @logger ||= Logger.new('logfile.log')
        case args.size
        when 1
            @logger.info(args[0])
        when 2
            raise 'Incorrect Logging Level' if !AVAILABLE_LEVELS.include? args[1]
            log_with_message(args[0], args[1])
        end
    end

    private
    def log_with_message message, level
        case level
            when :debug
                @logger.debug(message)
            when :info
                @logger.info(message)
            when :warn
                @logger.warn(message)
            when :error
                @logger.error(message)
            when :fatal
                @logger.fatal(message)
        end
    end
end