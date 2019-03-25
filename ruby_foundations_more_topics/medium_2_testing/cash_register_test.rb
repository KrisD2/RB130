require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 30

    assert_equal 10, register.change(transaction)
  end

  def test_give_receipt
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    assert_output("You've paid $#{20}.\n") do
       register.give_receipt(transaction)
     end
  end

  def test_prompt_for_payment
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    input = StringIO.new("20\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)

    assert_equal(20, transaction.amount_paid)
  end

  def test_prompt_for_payment2
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    input = StringIO.new("20\n")
    transaction.prompt_for_payment(input: input)

    assert_equal(20, transaction.amount_paid)
  end

end
