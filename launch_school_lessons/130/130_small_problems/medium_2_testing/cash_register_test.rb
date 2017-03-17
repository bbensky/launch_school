require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(500)

    transaction.amount_paid = 500

    register.accept_money(transaction)
    assert_equal(1500, register.total_money)
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(500)
    transaction.amount_paid = 600

    assert_equal(100, register.change(transaction))
  end

  def test_give_receipt
    register = CashRegister.new(1000)
    transaction = Transaction.new(500)

    expected_text = "You've paid $#{transaction.item_cost}.\n"

    assert_output(expected_text) {register.give_receipt(transaction)}
  end
end