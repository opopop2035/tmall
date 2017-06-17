package com.tmall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tmall.dao.ReviewDao;
import com.tmall.model.Review;
import com.tmall.service.ReviewService;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	@Resource
	private ReviewDao reviewDao;
	
	@Override
	public List<Review> listById(int pid){
		return reviewDao.searchById(pid);
	}

	@Override
	public void addReview(Review review) {
		reviewDao.addReview(review);
	}
}
