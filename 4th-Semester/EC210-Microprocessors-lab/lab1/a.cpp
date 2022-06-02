class Solution {
public:
    string longestPalindrome(string s) {
        int* arr = new int[s.length()*s.length()]{0};
        return recurseApp(s, 0, s.length()-1, arr);
    }
    
    int recurse(string s, int l, int r, int* arr){
        if(l>=r) {
            arr[l*s.length() +l]=2;
            return 1;
        }
        if(s[l]==s[r]){
            if(arr[(l+1)*s.length() +r-1]==0)return recurse(s, l+1 , r-1, arr);
            else if(arr[(l+1)*s.length()+ (r-1)] == 2){
                arr[l*s.length() +r] =2; 
                    return 1;
            }else{
            arr[l*s.length() +r] = 1;
            return 0;
        }
        } else{
            arr[l*s.length() +r] = 1;
            return 0;
        }
    }
    string recurseApp (string s, int l, int r, int* arr){
        if(l==r) return s.substr(l,1);
        if(recurse(s,l,r, arr)) return s.substr(l, r-l+1);
        else {
            string sl = recurseApp (s,  l+1, r, arr);
            string sr = recurseApp (s,  l, r-1, arr);
            if(sl.length() > sr.length()) return sl;
            else return sr;
        }
    }
};


	AREA Qtwo, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
Start	MOV R1, #0x0003D000; Value_1_low
		MVN R2, #0x1000000E; Value_1_high
		MOV R3, #0x0003D000; Value_2_low
		MVN R4, #0x0000FF00; Value_2_high
		ADDS R5, R1, R2; Value_1_low + Value_2_low
		ADC  R6 
		ADDS R4, R1, R3;
		SUB  R5, R3, #-0x3A00;
		SUBS R6, R4, R2;
		RSB R7, R1, R4;
		ADDS R1, R2, R3;
		MVN R3, #0x01;
		ADC R4, R7, #-3;
		SBC R5, R4, R2;
Stop B Stop ; Stop program
	END