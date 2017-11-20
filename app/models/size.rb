class Size < ActiveRecord::Base
    belongs_to :product_color

    def disable_select
        if self.has_stock == 0
            true
        else
            false
        end
    end
end
