module ListingsHelpers
  def new_listing(title: "batcave", location: "London", beds: 2, price: 100, max_guests: 3)
    visit '/listings/new'
    fill_in :title, with: title
    fill_in :location, with: location
    fill_in :beds, with: beds
    fill_in :price, with: price
    fill_in :max_guests, with: max_guests
    click_button 'Add listing'
  end
end
