<script>
export default {
  data() {
    return {
      comment: '', // 댓글 내용을 담을 데이터
    };
  },
  methods: {
    submitComment() {
      // 댓글 등록 처리 등 필요한 동작을 수행
      this.$emit('submit', this.comment); // 부모 컴포넌트로 댓글 내용을 전달
      this.comment = ''; // 댓글 내용 초기화
    },
  },
};
</script>

<style scoped>
/* 컴포넌트에만 적용되는 스타일 */
</style>
