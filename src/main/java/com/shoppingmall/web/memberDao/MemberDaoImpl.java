package com.shoppingmall.web.memberDao;


import java.util.Collection;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.shoppingmall.web.admin.model.OrderDetailVo;
import com.shoppingmall.web.admin.model.OrderListVo;
import com.shoppingmall.web.memberDto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Inject
	private SqlSessionTemplate sql;
	private static String namespace = "spm";
	//회원가입
	@Override
	public void register(MemberDto memberDto) throws Exception{
		sql.insert(namespace +".register", memberDto);
	
	}
	
    // 아이디 중복 체크
    @Override
    public int idCheck(String id) {
        int cnt = sql.selectOne(namespace+".idCheck", id);
        return cnt;
    }
    
    // 닉네임 중복 체크
    @Override
    public int NickCheck(String nickname) {
        int cnt = sql.selectOne(namespace+".NickCheck", nickname);
        return cnt;
    }
    
    // 이메일 중복 체크
    @Override
    public int emailCheck(String email) {
        int cnt = sql.selectOne(namespace+".emailCheck", email);
        return cnt;
    }
	
	//로그인
	@Override
	public MemberDto viewlogin(MemberDto memberDto) {
		return sql.selectOne(namespace + ".viewlogin", memberDto );
	}
	
	//로그아웃
	public void logout(HttpSession session) {
		
	}
	
	//아이디 비밀번호 찾기 필요한 쿼리
	public MemberDto loginUser(MemberDto memberDto) {
		return sql.selectOne(namespace + ".loginUser", memberDto);
	}

	public MemberDto findId(MemberDto memberDto) {
		return sql.selectOne(namespace + ".findId", memberDto);
	}

	public MemberDto findPw(MemberDto memberDto) {
		return sql.selectOne(namespace + ".findPw", memberDto);
	}

	public void updatePw(MemberDto memberDto) {
		sql.update(namespace + ".updatePw", memberDto);
	}
	//내정보 조회
	@Override
	public MemberDto readMypage(String id) {
		return sql.selectOne(namespace + ".readmypage", id);
	}
	
	//내정보 수정
	@Override
	public void updateMypage(MemberDto memberDto) {
		sql.update(namespace + ".updatemypage", memberDto);
	}
	
	//비밀번호 체크
	@Override
	public String pwCheck(String id){
		return sql.selectOne(namespace + ".pwCheck", id);
	}
	//내정보 탈퇴
	@Override
	public void deleteMypage(String id) {
		sql.delete(namespace + ".deletemypage", id);
	}
	//주문조회
	
	@Override
	public Collection<OrderListVo> myorderList(Long num){
		return sql.selectList("myorderlist",num);
	}

}
