module Lpad
  module Device
    class Base
      CONTROL_BUTTONS = {
        up: 104,
        down: 105,
        left: 106,
        right: 107,
        session: 108,
        user_1: 109,
        user_2: 110,
        mixer: 111
      }.freeze

      SCENE_BUTTONS = {
        vol: 8,
        pan: 24,
        snd_A: 40,
        snd_B: 56,
        stop: 72,
        trk_on: 88,
        solo: 104,
        arm: 120
      }.freeze

      attr_reader :device, :mode

      def initialize device
        @device = device
      end

      # indexes are 1-origin
      def grid_to_code x, y
        (x-1) + (y-1) * 16
      end

      def set params={}
        color = {red: 0, green: 0}.merge(
          {red: params[:red], green: params[:green]}
        ) do |key, default, param|
          (param.is_a?(Integer) && (0 <= param) && (param <= 3))? param : default
        end

        if params.key?(:button)
          if CONTROL_BUTTONS.key?(params[:button])
            key_id = [176, CONTROL_BUTTONS[params[:button]]]
          elsif SCENE_BUTTONS.key?(params[:button])
            key_id = [144, SCENE_BUTTONS[params[:button]]]
          else
            raise RuntimeError
          end
        else
          key_id = [144, grid_to_code(params[:x], params[:y])]
        end

        @device.puts(*key_id, ((color[:green] * 0x10) + color[:red]))
      end

      def reset!
        @device.puts(176, 0, 0)
      end
    end
  end
end
