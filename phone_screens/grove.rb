# Include libs: Rspec

# input = [1, 1, 1, 1]  # => "sn4 sn4 sn4 sn4"
# input = [1, 0, 1, 1]  # => "sn2 sn4 sn4"
# 2 / 4 => 1/2 => 2
# 1 / 4 => 1/4 => 4

# input = [1, 0]        # => "sn1"
# 2 / 2 = 1/1 = 1
# input = [1, 0, 1, 1, 1, 0, 0, 0] # => "sn4 sn8 sn8 sn2"

# if false
#     input1 = {
#         "sn": [0, 0, 0, 1],
#         "bd": [1, 0, 1, 0]
#     } # => "bd2 bd4 sn4"
#
#     input2 = {
#         "sn": [0, 0, 1, 0],
#         "bd": [1, 0, 0, 1]
#     } # => "bd2 sn4 bd4"
#
#     input3 = {
#         "sn": [0, 0, 1, 0],
#         "bd": [1, 0, 0, 1],
#         "hh": [1, 1, 1, 1]
#         #"hh": [1*(bd hh), 1, 1*(sn), 1*(bd)]
#     } # => "<bd hh>4 hh4 sn4 bd4"
# end
# [['bd', 'hh'], ['hh'], ['sn'], ['bd']]
# 1*(bd hh), 1, 1*(sn), 1*(bd)]

require 'pp'

def generate(input={})
    template = Array.new { nil }
    input.each do |k,_list|
        _list.each_with_index do |v, i|
            if v == 1
                template[i] ||= []
                template[i] << k
            end
        end
    end
    # [['bd', 'hh'], nil, ['hh'], ['sn'], ['bd']]
    pp template

    list = template
    counter = 0
    last_label = ""
    res = ""
    (0...list.size).each do |i|
        if list[i] != nil
            if i == 0
                counter = 1
                last_label = " <#{template[i].join(',')}>"
                next
            end
            duration = 1 / (counter.to_f / list.size)
            res += last_label + duration.to_i.to_s
            last_label = " <#{template[i].join(',')}>"
            counter = 1
            # pp "in 1: #{i}"
        else
            counter += 1
            # pp "in 0: #{i}"
        end
    end
    # pp counter
    if counter != 0
        duration = 1 / (counter.to_f / list.size)
        res += last_label + duration.to_i.to_s
    end
    return res.strip
end

puts "Test case 1"
pp generate({
        "sn": [0, 0, 0, 1],
        "bd": [1, 0, 1, 0]
    })
pp "bd2 bd4 sn4"

puts "Test case 2"
pp generate( {
        "sn": [0, 0, 1, 0],
        "bd": [1, 0, 0, 1]
    })
pp "bd2 sn4 bd4"

puts "Test case 3"
pp generate({
        "sn": [0, 0, 1, 0],
        "bd": [1, 0, 0, 1],
        "hh": [1, 1, 0, 0]
        #"hh": [1*(bd hh), 1, 1*(sn), 1*(bd)]
    })
pp "<bd hh>4 hh4 sn4 bd4"
