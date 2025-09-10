import streamlit as st
import requests
import pandas as pd

BASE = "http://127.0.0.1:5000"

st.set_page_config(
    page_title="Diabetes Prediction Dashboard",
    page_icon="🩺",
    layout="wide"
)

# Header
st.title("🩺 Diabetes Prediction Dashboard")
st.markdown("Dashboard untuk prediksi risiko diabetes menggunakan **Flask API + XGBoost**")

# --- Tabs ---
tab1, tab2 = st.tabs(["📊 Prediksi by Patient ID", "📝 Prediksi Manual"])

# --- Tab 1: Prediksi by ID ---
with tab1:
    st.subheader("Prediksi dari Database (by Patient ID)")
    col1, col2 = st.columns([1,2])
    with col1:
        pid = st.number_input("Masukkan Patient ID:", min_value=1, value=1, step=1)
        if st.button("🔍 Prediksi Pasien", use_container_width=True):
            try:
                r = requests.get(f"{BASE}/predict/id/{pid}", timeout=5)
                r.raise_for_status()
                data = r.json()
                pred_label = data.get("label", "")
                st.success(f"**Hasil Prediksi: {pred_label}**")
                st.json(data)
            except Exception as e:
                st.error(f"Gagal memuat data: {e}")

# --- Tab 2: Prediksi Manual ---
with tab2:
    st.subheader("Masukkan Data Manual")
    with st.form("manual_form"):
        c1, c2, c3 = st.columns(3)
        with c1:
            Pregnancies = st.number_input("Pregnancies", 0, 20, 2)
            Glucose = st.number_input("Glucose", 0, 300, 120)
            BloodPressure = st.number_input("Blood Pressure", 0, 200, 70)
        with c2:
            SkinThickness = st.number_input("Skin Thickness", 0, 100, 20)
            Insulin = st.number_input("Insulin", 0, 1000, 85)
            BMI = st.number_input("BMI", 0.0, 100.0, 25.5)
        with c3:
            DiabetesPedigreeFunction = st.number_input("DPF", 0.0, 5.0, 0.351, format="%.3f")
            Age = st.number_input("Age", 0, 120, 29)

        submitted = st.form_submit_button("🚀 Prediksi")
        if submitted:
            payload = {
                "Pregnancies": Pregnancies,
                "Glucose": Glucose,
                "BloodPressure": BloodPressure,
                "SkinThickness": SkinThickness,
                "Insulin": Insulin,
                "BMI": BMI,
                "DiabetesPedigreeFunction": DiabetesPedigreeFunction,
                "Age": Age
            }
            try:
                r = requests.post(f"{BASE}/predict/manual", json=payload, timeout=5)
                r.raise_for_status()
                result = r.json()
                pred_label = result.get("label", "")
                st.success(f"**Hasil Prediksi: {pred_label}**")
                st.json(result)
            except Exception as e:
                st.error(f"Gagal melakukan prediksi: {e}")

# --- Footer ---
st.markdown("---")
st.caption("Dibuat dengan ❤️ menggunakan **Flask + Streamlit + XGBoost**")
