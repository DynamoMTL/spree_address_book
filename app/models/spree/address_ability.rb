class Spree::AddressAbility
  include CanCan::Ability

  def initialize(user)
    can :read, Spree::Address
  end
end