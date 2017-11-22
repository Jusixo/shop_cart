class AddStripeCardTokenToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :card_token, :string
  end
end
