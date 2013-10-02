require 'spec_helper'

describe Vote do 

  it { should belong_to :post}
  it { should belong_to :user}
end  