require 'spec_helper'
include FirstGem

describe FirstGem do
  it 'has a version number' do
    expect(FirstGem::VERSION).not_to be nil
  end

  it 'creates a vector' do
    v = Vector.new([5,2,3])
    expect(v.input).to(eq([5,2,3]))
  end

  it 'finds magnitude of vector' do
  	v = Vector.new([7,8])
  	expect(v.magnitude).to(eq(10.63014581273465))
  end

  it 'sums vector with another vector' do 
    v1 = Vector.new([2,3])
    v2 = Vector.new([1,4])
    expect((v1+v2).to_a).to(eq([3,7]))
  end

  it 'sums 3 vectors' do
    v1 = Vector.new([5,3])
    v2 = Vector.new([2,3])
    v3 = Vector.new([1,2])
    expect((v1+v2+v3).to_a).to(eq([8,8]))
    # array
    expect((v1+v2+[1,2]).to_a).to(eq([8,8]))
  end


  it 'substract vector from another vector' do 
  v1 = Vector.new([2,3])
  v2 = Vector.new([1,4])
  expect((v1-v2).to_a).to(eq([1,-1]))
  # sub array
  expect((v1-[1,4]).to_a).to(eq([1,-1]))
  end

  it 'scales and sums vector' do
    v = Vector.new([5,5])
    v_scale = v.scale_by(3)
    expect(v_scale.to_a).to(eq([15,15]))
    expect((v_scale+v).to_a).to(eq([20,20]))
    #sum with swaped vectors
    expect((v+v_scale).to_a).to(eq([20,20]))
  end

 it 'finds the distance between two vectors' do
    v1 = Vector.new([5,4])
    v2 = Vector.new([8,7])
    expect(v1.distance_to(v2)).to(eq(4.242640687119285))
    #array
    expect(v1.distance_to([8,7])).to(eq(4.242640687119285))
 end 

 it 'sub of vectors magnitude should eq to distance method' do
  v1 = Vector.new([5,4])
  v2 = Vector.new([8,7])
  expect(v1.distance_to(v2)).to(eq(4.242640687119285))
  sub = v1 - v2
  expect(v1.distance_to(v2)).to(eq(sub.magnitude))
  #even if swaped - vector magnitude will always be positive **2
  sub = v2 - v1
  expect(v1.distance_to(v2)).to(eq(sub.magnitude))
 end

 it 'applies permutation formula' do 
  expect(permutation(5)).to(eq(120))
  expect(permutation(5,3)).to(eq(60))
  expect(permutation(5,3)).to(eq(permutation(5)/permutation(5-3)))
 end

 it 'applies combination formula' do
  expect(combinations(6,4)).to(eq(15))
  comb_to_perm = (permutation(6) / permutation(6-4)) / permutation(4)
  expect(combinations(6,4)).to(eq(comb_to_perm))
 end
end
