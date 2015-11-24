class Calculator
  class << self

    def calculate(amount, months, percent, kind)
      if kind == 'anuitet'
        anuitet(amount, months, percent)
      elsif kind == 'differential'
        differential(amount, months, percent)
      end
    end

    private

      def anuitet(amount, months, percent)
        ps = (percent.to_f / (100 * 12))
        ap = (amount.to_f * (ps + (ps / ( (1 + ps) ** months.to_i - 1)))).round(2)
        payments = { months: [] }
        balance = amount.to_f
        np_total = 0

        months.to_i.times do
          np = (balance * (percent.to_f / (100 * 12)))
          np_total += np
          od = ap - np
          balance = balance - od
          balance = balance > 0 ? balance : 0
          payments[:months] << { np: np.round(2), od: od.round(2),
                                 od_plus_np: ap, balance: balance.round(2) }
        end

        payments[:np_total] = np_total.round(2)
        payments[:np_total_plus_amount] = (np_total + amount.to_f).round(2)
        payments[:amount] = amount.to_f
        payments
      end

      def differential(amount, months, percent)
        od = (amount.to_f / months.to_i)
        balance = amount.to_f
        payments = { months: [] }
        np_total = 0

        months.to_i.times do
          np = (balance * (percent.to_f / (100 * 12)))
          np_total += np
          balance = balance - od
          balance = balance > 0 ? balance : 0
          payments[:months] << { np: np.round(2), od: od.round(2),
                                 od_plus_np: (np + od).round(2), balance: balance.round(2) }
        end

        payments[:np_total] = np_total.round(2)
        payments[:np_total_plus_amount] = (np_total + amount.to_f).round(2)
        payments[:amount] = amount.to_f
        payments
      end
  end
end