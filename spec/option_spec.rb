require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Twitter2github::Option do
  describe 'user' do
    context 'empty' do
      subject {
        Twitter2github::Option.new().user
      }
      it {
        should be_nil
      }
    end
    context 'empty array' do
      subject {
        Twitter2github::Option.new( [] ).user
      }
      it {
        should be_nil
      }
    end
    context 'user' do
      subject {
        Twitter2github::Option.new( %w( -u user ) ).user
      }
      it {
        should == 'user'
      }
    end
  end
end
