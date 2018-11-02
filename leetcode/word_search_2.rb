require 'pp'

STOP_CHAR = 1

class TrieWithBoard < Hash
    attr_accessor :board, :board_size_x, :board_size_y, :found

    def initialize
      super
      @found = []
    end

    def board=(board)
      @board = board
      @board_size_x = board.size
      @board_size_y = board[0].size
    end

    def search_in_board
        pointer = self
        board.each_with_index do |row, x|
            row.each_with_index do |char, y|
                check_current_char(pointer, char, x, y, [])
            end
        end
        found.compact.uniq
    end

    def check_current_char(pointer, char, x, y, visited=[])
        # pp "HERE" * 40
        # pp pointer, char, x, y, visited
        # pp visited
        _visited = visited.clone
        if pointer[char]
            pointer = pointer[char]
            if pointer[STOP_CHAR]
                found << pointer[STOP_CHAR]
            end
            ([[x-1,y], [x+1, y], [x, y-1], [x,y+1]] - visited).each do |pair|
                if pair[0] < 0 || pair[1] < 0 || pair[0] > (board_size_x - 1) || pair[1] > (board_size_y - 1)
                  next
                end
                next_char = board[pair[0]][pair[1]]
                _visited << [x,y]
                check_current_char(pointer, next_char, pair[0], pair[1], _visited)
            end
            return nil
        end
    end

    def insert(word)
        pointer = self
        word.chars.each do |char|
            pointer[char] ||= {}
            pointer = pointer[char]
        end
        pointer[STOP_CHAR] = word
    end

    def search(word)
        pointer = self
        word.chars.each do |c|
            pointer = pointer[c]
            unless pointer
                return false
            end
        end
        return !!pointer[STOP_CHAR]
    end

    def starts_with(prefix)
        pointer = self
        prefix.chars.each do |c|
            pointer = pointer[c]
            unless pointer
                return false
            end
        end
        return true
    end
end


# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
    trie = TrieWithBoard.new()
    trie.board = board
    words.map do |word|
        trie.insert(word)
    end
    # pp trie
    return trie.search_in_board
end

# boards = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]]
# words = ["oath","pea","eat","rain"]
boards = [
  ["b","a","a","b","a","b"],
  ["a","b","a","a","a","a"],
  ["a","b","a","a","a","b"],
  ["a","b","a","b","b","a"],
  ["a","a","b","b","a","b"],
  ["a","a","b","b","b","a"],
  ["a","a","b","a","a","b"]
]
words = ["aabbbbabbaababaaaabababbaaba","abaabbbaaaaababbbaaaaabbbaab","ababaababaaabbabbaabbaabbaba"]
# ["aaaaaaaaaaaa"]
pp "FINAL"
pp find_words(boards, words)
