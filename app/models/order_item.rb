# Michele Welponer, a simple shopping cart.
# Copyright (C) 2016  Michele Welponer

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

class OrderItem < ActiveRecord::Base
  BASIC_SALE_TAX_PERCENTAGE = 10
  IMPORT_TAX_PERCENTAGE = 5

  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price + basic_sale_tax + import_tax
      #( product.basicSaleTaxes ? ((10*product.price/100*20).ceil / 20.0) : 0 ) + 
      #( product.imported ? ((5*product.price/100*20).ceil / 20.0) : 0 )
    end
  end

  def basic_sale_tax
    # round up to the nearest 0.05 => 1/0.05 = 20
    product.basicSaleTaxes ? ( (BASIC_SALE_TAX_PERCENTAGE * 
      product.price/100*20).ceil / 20.0 ) : 0 
  end

  def import_tax
    # round up to the nearest 0.05 => 1/0.05 = 20
    product.imported ? ( (IMPORT_TAX_PERCENTAGE * 
      product.price/100*20).ceil / 20.0 ) : 0
  end

  def total_price
    unit_price * quantity
  end

  private
    def product_present
      if product.nil?
        errors.add(:product, "is not valid or is not active.")
      end
    end

    def order_present
      if order.nil?
        errors.add(:order, "is not a valid order.")
      end
    end

    def finalize
      self[:unit_price] = unit_price
      self[:total_price] = quantity * self[:unit_price]
    end
end
