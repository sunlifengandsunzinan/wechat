/**
 * @Title: AreaRegion.java
 * @Package cn.com.ccms.vo
 * @Description: TODO
 * Copyright: Copyright (c) 2011 
 * Company:永乐科技
 * 
 * @author 程明
 * @date 2015年4月10日 下午1:37:17
 * @version V1.0
 */

package cn.com.loan.vo;

import java.io.Serializable;
import java.util.List;

import jnr.ffi.Struct.in_addr_t;

/**
 * @ClassName: Songs
 * @Description: TODO
 * @author 孙立峰
 * @date 2017年4月28日 下午1:37:17
 *
 */
public class Songs implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8939063778259804281L;
	
	
	
	private String name;
	private int id;
	private int position;
	private String[] alias;
	private int status;
	private int fee;
	private int copyrightId;
	private String disc;
	private int no;
	private List<Artists> artists;
	private Album album;
	private Boolean starred;
	private int popularity;
	private int score;
	private int starredNum;
	private int duration;
	private int playedNum;
	private int dayPlays;
	private int hearTime;
	private String ringtone;
	private String crbt;
	private String audition;
	private String copyFrom;
	private String commentThreadId;
	private String rtUrl;
	private int ftype;
	private String[] rtUrls;
	private int copyright;
	private int mvid;
	private int rtype;
	private String rurl;
	private String mp3Url;
	private BMusic bMusic;
	private HMusic hMusic;
	private MMusic mMusic;
	private LMusic lMusic;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public String[] getAlias() {
		return alias;
	}
	public void setAlias(String[] alias) {
		this.alias = alias;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public int getCopyrightId() {
		return copyrightId;
	}
	public void setCopyrightId(int copyrightId) {
		this.copyrightId = copyrightId;
	}
	public String getDisc() {
		return disc;
	}
	public void setDisc(String disc) {
		this.disc = disc;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public List<Artists> getArtists() {
		return artists;
	}
	public void setArtists(List<Artists> artists) {
		this.artists = artists;
	}
	public Album getAlbum() {
		return album;
	}
	public void setAlbum(Album album) {
		this.album = album;
	}
	public Boolean getStarred() {
		return starred;
	}
	public void setStarred(Boolean starred) {
		this.starred = starred;
	}
	public int getPopularity() {
		return popularity;
	}
	public void setPopularity(int popularity) {
		this.popularity = popularity;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getStarredNum() {
		return starredNum;
	}
	public void setStarredNum(int starredNum) {
		this.starredNum = starredNum;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getPlayedNum() {
		return playedNum;
	}
	public void setPlayedNum(int playedNum) {
		this.playedNum = playedNum;
	}
	public int getDayPlays() {
		return dayPlays;
	}
	public void setDayPlays(int dayPlays) {
		this.dayPlays = dayPlays;
	}
	public int getHearTime() {
		return hearTime;
	}
	public void setHearTime(int hearTime) {
		this.hearTime = hearTime;
	}
	public String getRingtone() {
		return ringtone;
	}
	public void setRingtone(String ringtone) {
		this.ringtone = ringtone;
	}
	public String getCrbt() {
		return crbt;
	}
	public void setCrbt(String crbt) {
		this.crbt = crbt;
	}
	public String getAudition() {
		return audition;
	}
	public void setAudition(String audition) {
		this.audition = audition;
	}
	public String getCopyFrom() {
		return copyFrom;
	}
	public void setCopyFrom(String copyFrom) {
		this.copyFrom = copyFrom;
	}
	public String getCommentThreadId() {
		return commentThreadId;
	}
	public void setCommentThreadId(String commentThreadId) {
		this.commentThreadId = commentThreadId;
	}
	public String getRtUrl() {
		return rtUrl;
	}
	public void setRtUrl(String rtUrl) {
		this.rtUrl = rtUrl;
	}
	public int getFtype() {
		return ftype;
	}
	public void setFtype(int ftype) {
		this.ftype = ftype;
	}
	public String[] getRtUrls() {
		return rtUrls;
	}
	public void setRtUrls(String[] rtUrls) {
		this.rtUrls = rtUrls;
	}
	public int getCopyright() {
		return copyright;
	}
	public void setCopyright(int copyright) {
		this.copyright = copyright;
	}
	public int getMvid() {
		return mvid;
	}
	public void setMvid(int mvid) {
		this.mvid = mvid;
	}
	public int getRtype() {
		return rtype;
	}
	public void setRtype(int rtype) {
		this.rtype = rtype;
	}
	public String getRurl() {
		return rurl;
	}
	public void setRurl(String rurl) {
		this.rurl = rurl;
	}
	public String getMp3Url() {
		return mp3Url;
	}
	public void setMp3Url(String mp3Url) {
		this.mp3Url = mp3Url;
	}
	public BMusic getbMusic() {
		return bMusic;
	}
	public void setbMusic(BMusic bMusic) {
		this.bMusic = bMusic;
	}
	public HMusic gethMusic() {
		return hMusic;
	}
	public void sethMusic(HMusic hMusic) {
		this.hMusic = hMusic;
	}
	public MMusic getmMusic() {
		return mMusic;
	}
	public void setmMusic(MMusic mMusic) {
		this.mMusic = mMusic;
	}
	public LMusic getlMusic() {
		return lMusic;
	}
	public void setlMusic(LMusic lMusic) {
		this.lMusic = lMusic;
	}
}
