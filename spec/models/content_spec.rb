require 'spec_helper'

describe Content do
  # associations
  it { should belong_to(:endpoint) }

  # mass assignment
  [:content, :endpoint_id].each do |attribute|
    it { should allow_mass_assignment_of(attribute) }
  end  
end
