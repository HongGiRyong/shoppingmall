package com.shoppingmall.web.memberservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.memberDao.MemberDao;

@Service
public class IdCheckServiceImpl implements IdCheckService{

    @Autowired
    private MemberDao memberDao;

    // 아이디 중복 체크
    @Override
    public int idCheck(String id) {
        int cnt = memberDao.idCheck(id);
        return cnt;
    }
}
