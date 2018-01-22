require 'rails_helper'
RSpec.describe Product, type: :model do
    # validation tests/examples here
  describe 'Product validations' do
    @cat = Category.new(name: 'test')
    product = Product.new(name: 'tessst', price: 100, quantity: 5, category: nil)
    product.category = @cat
      it 'need name' do
      product.name = nil
      expect(product).to_not(be_valid)
      # expect(bean.valid?).to(be(false))
      # expect(bean.valid?).to(be_falsey)
      # expect(bean).not_to(be_valid)
    end
    it 'need price' do
    product.price = nil
    expect(product).to_not(be_valid)
      # expect(bean.valid?).to(be(false))
      # expect(bean.valid?).to(be_falsey)
      # expect(bean).not_to(be_valid)
    end
    it 'need quantity' do
    product.quantity = nil
    expect(product).to_not(be_valid)
      # expect(bean.valid?).to(be(false))
      # expect(bean.valid?).to(be_falsey)
      # expect(bean).not_to(be_valid)
    end
    it 'need category' do
    product.category = nil
    expect(product).to_not(be_valid)
      # expect(bean.valid?).to(be(false))
      # expect(bean.valid?).to(be_falsey)
      # expect(bean).not_to(be_valid)
    end
  end
end