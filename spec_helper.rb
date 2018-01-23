require 'tmpdir'

def in_a_clean_room
  Dir.mktmpdir 'factor-koans' do |tmpdir|
    `cp -r meditate.sh koans #{tmpdir}`
    Dir.chdir tmpdir
    yield
  end
end

def meditate
  @output = `./meditate.sh`
end

def i_should_see(expected)
  raise "\n\n-- expected to see\n#{expected}\n-- but got \n#{@output}" unless @output =~ /#{expected}/
end

def i_should_be_directed_to(line:, of_file:)
  i_should_see("Your attention is directed to line #{line} of #{of_file}")
  @latest_file = of_file
end

def then_i_fill_in(value)
  update_contents(/\s_!_\s/, " #{value} ")
end

def then_i_replace(content:, with:)
  update_contents(content, with)
end

def update_contents(old, new)
  File.read(@latest_file).tap do |contents|
    File.write(@latest_file, contents.sub(old, new))
  end
end
