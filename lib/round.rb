class Round

    attr_reader :deck, 
                :turns, 
                :current_card,
                :turn,
                :number_correct

    def initialize(deck)
        @deck=deck
        @turns=[]
        @card_index=0
        @number_correct=0.0
        @cat_correct=0.0
    end

    def current_card
        @deck.cards[@card_index]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @deck.cards.shift
        if new_turn.correct? == true
            @number_correct += 1.0
        end

        return new_turn
    end

    def number_correct
        # if turn.correct? == true
        #     @number_correct += 1.0
        return @number_correct
        # end
    end

    def number_correct_by_category(category)
        cat_correct = 0
        @turns.each do |turn|
            if turn.card.category == category && turn.correct?
                cat_correct += 1.0
            end
        end
        return cat_correct
    end

    def percent_correct
        @number_correct / @turns.count.to_f * 100.0
        # require 'pry'; binding.pry
    end
    
end