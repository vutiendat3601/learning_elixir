defmodule Cards do
  @moduledoc """
    Provides methods for creating and h;andling a deck of cards
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Iteration and create a new list with the return value (comprehension)

    # List.flatten(
    #   for value <- values do
    #     for suit <- suits do
    #       "#{value} of #{suit}"
    #     end
    #   end
    # )
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    # Enum is the module working with Enumaration types []
    Enum.shuffle(deck)
  end

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  # Save a variable to the file system
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  # Load a variable to the file system
  def load(filename) do
    case File.read(filename) do
      # If result in case matching this, dedicate that the result has :ok var
      {:ok, binary} -> :erlang.binary_to_term(binary)
      # If result in case matching this, dedicate that the result has :error var
      # {:error, :enoent} -> "File not found!"

      # If don't care about rest value in result use "_"
      {:error, _} -> "File not found!"
    end
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck()
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    # =================== The snippet code above same as following:

    # Pipe operator => Result from current will pass into the first argument of next function call
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

  def for_each(deck) do
    for d <- deck do
      d
    end
  end
end
