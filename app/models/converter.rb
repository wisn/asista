class Converter < Action

  private
    @unit = ""
    @value = ""

  public
    def initialize argument = Argument.new
      super argument

      parameters = argument.get_parameters

      if parameters.length < 3
        set_result "Maaf, gimana tadi? Aku ga ngerti harus apa..."
      else
        if parameters[0][-1].eql? 'm'
          rules = {
            "am": -18,
            "fm": -15,
            "pm": -12,
            "nm": -9,
            "μm": -6,
            "mm": -3,
            "cm": -2,
            "dm": -1,
            "m": 0,
            "dam": 1,
            "hm": 2,
            "km": 3,
            "Mm": 6,
            "Gm": 9,
            "Tm": 12,
            "Pm": 15,
            "Em": 18
          }

          value = /\A(?:-?[0-9]\d*)?(.\d+)/.match(parameters[0]).to_s

          if value.nil?
            set_result "Ya? Angkanya mana?"
          else
            unit = parameters[0][value.length..parameters[0].length].to_sym

            print unit

            if rules[unit].nil?
              set_result "Satuannya apa?"
            else
              keys = rules.keys

              unit_s = parameters[2].to_sym

              if rules[unit_s].nil?
                set_result "Diubah jadi apa?"
              else
                inverter = keys.index(unit) + 1
                inverter += inverter < 9 ? 9 : inverter > 9 ? (-9) : 0

                value = value.to_d

                loc = inverter > 9 ? -1 : 1
                loc = keys[inverter + loc].to_sym

                value *= 10 ** rules[unit]
                value /= 10 ** rules[unit_s]

                set_result (value.to_s + unit_s.to_s)
              end
            end
          end
        else
          set_result "Aku belum belajar buat ini..."
        end
      end
    end

end
