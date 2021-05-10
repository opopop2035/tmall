package com.tmall.service;

import java.util.List;

import com.tmall.model.Review;

public interface ReviewService {
	public List<Review> listById(int pid);
	public void addReview(Review review);
}
