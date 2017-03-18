require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  # def test_prompt_for_payment
  #   input = StringIO.new('600')
  #   output = StringIO.new
  #   transaction = Transaction.new(500)
  #   transaction.prompt_for_payment(input: input, output: output)

  #   assert_equal 600, transaction.amount_paid
  # end

  # alt using capture_io

  def test_prompt_for_payment
    input = StringIO.new('600')
    transaction = Transaction.new(500)

    capture_io { transaction.prompt_for_payment(input: input) }

    assert_equal 600, transaction.amount_paid
  end
end