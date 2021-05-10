package com.tmall.dao;

import java.util.List;

import com.tmall.model.Review;

public interface ReviewDao {
	public int getCount(int pid);
	public List<Review> searchById(int pid);
	public void addReview(Review review);
}
