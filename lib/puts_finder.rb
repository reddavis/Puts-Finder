module PutsFinder
  class << self
    def state=(new_state)
      if new_state == :on
        overwrite_puts
      else
        rewrite_puts
      end
    end

    private

    def overwrite_puts
      Object.class_eval do
        def puts(message)
          raise "Im here!"
        end
      end
    end

    # ZOMG!
    def rewrite_puts
      Object.class_eval do
        def puts(message)
          Kernel.puts(message)
        end
      end
    end
  end
end